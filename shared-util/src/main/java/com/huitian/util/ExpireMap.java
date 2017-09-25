package com.huitian.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 自带超时功能的Map,当存入的key超过指定的时间后，会自动从当前Map中移除。目前是每分钟清理一次
 * 
 * @author lihome
 *
 * @param <K>
 * @param <V>
 * 
 * @see java.util.HashMap
 */
public class ExpireMap<K, V> extends HashMap<K, V> {

    private static final long serialVersionUID = 1L;

    private static final long INTERVAL = 60 * 1000;//一分钟

    /** 默认的超时时间(秒) */
    private static final long DEFAULT_TIMEOUT = 7200;

    private long timeout = DEFAULT_TIMEOUT * 1000;

    private Map<K, Long> keyTime = New.hashMap();//一个映射，将键和当前时间加入其中，以便定期清理过期映射

    /** 使用默认的超时时间--目前是7200秒，即2小时 */
    public ExpireMap() {
        this(DEFAULT_TIMEOUT);
    }

    /**
     * 使用自定义的超时时间，秒数
     * @param timeout
     *            in seconds before keys timeout
     */
    public ExpireMap(long timeout) {
        this.timeout = timeout * 1000;

        Timer timer = new Timer();
        timer.schedule(new CleanTimerTask(timer), INTERVAL);
    }

    /**
     * 将一个键值对加入到映射
     */
    @Override
    public V put(K key, V value) {
    	//将键和当前时间（精确到毫秒）加入到keyTime
        keyTime.put(key, System.currentTimeMillis());
        //然后将键值对加入到本映射
        return super.put(key, value);
    }

    /**
     * 将映射元素移除
     */
    @Override
    public V remove(Object key) {
    	//keyTime中移除相应元素
        keyTime.remove(key);
        //本映射中移除元素
        return super.remove(key);
    }

    /**
     * 清理超时映射
     */
    private void cleanup() {
    	//链表，存储已经超时的键
        List<K> timeoutKeys = New.list();
        //遍历keytime
        for (java.util.Map.Entry<K, Long> e : keyTime.entrySet()) {
        	//如果超时，将键加入到timeoutKeys，以便下一步删除
            if (System.currentTimeMillis() - e.getValue() >= timeout) {
                timeoutKeys.add(e.getKey());
            }
        }
        //将timeoutKeys中存储的键，从本映射中全部删除
        for (K k : timeoutKeys) {
            this.remove(k);
        }
    }

    /**
     * 定时任务——执行时限是多长？
     * @author ZlyjB
     *
     */
    public class CleanTimerTask extends TimerTask {
        // Reference to containing Timer.
        private final Timer _timer;

        // Constructor takes reference to containing
        // Timer so it can reset itself after execution.
        CleanTimerTask(Timer _timer) {
            this._timer = _timer;
        }

        // 
        /**
         * 清理映射。一开始就清理一次，然后每隔INTERVAL清理一次
         */
        public void run() {

            cleanup();//清理映射

            _timer.schedule(new CleanTimerTask(_timer), INTERVAL);
        }
    }
}