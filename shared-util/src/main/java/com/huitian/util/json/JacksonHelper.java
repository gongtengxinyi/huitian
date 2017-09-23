package com.huitian.util.json;

import java.io.IOException;
import java.io.InputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.huitian.util.Dto;

/**
 * Jackson Helper JSON实用类
 * 
 * @author lihome
 * 
 * @see com.fasterxml.jackson.databind.ObjectMapper
 *
 */
public class JacksonHelper {

    private static Logger LOG = LoggerFactory.getLogger(JacksonHelper.class);

   
    //Jackson 框架，轻易转换JSON
    //Jackson可以轻松的将Java对象转换成json对象和xml文档，同样也可以将json、xml转换成Java对象。
    
    /**
     * converting between Java objects (instances of JDK provided core classes,
     * beans), and matching JSON constructs.
     */
    private static ObjectMapper mapper = new JsonObjectMapper();

    /**
     * 将对象转换为json字符串  Method that can be used to serialize any Java value as a String.
     * 
     * @param o
     * @return
     */
    public static String toJson(Object o) {
        try {
            return mapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            LOG.error("Generate Object to json failure. {}", e);
            return "{}";
        }
    }

    public static <T> T toObject(String json, Class<T> clazz) {
        try {
            return (T) mapper.readValue(json, clazz);
        } catch (IOException e) {
            LOG.error("Convert json [{}] to object error: {}", json, e);
        }

        return null;
    }

    public static <T> T toObject(JsonNode node, Class<T> clazz) {
        try {
            return (T) mapper.treeToValue(node, clazz);
        } catch (IOException e) {
            LOG.error("Convert JsonNode [{}] to object error: {}", node, e);
        }

        return null;
    }

    public static <T> T toObject(InputStream is, Class<T> clazz) {
        try {
            return mapper.readValue(is, clazz);
        } catch (IOException e) {
            LOG.error("Convert InputStream to object error: {}", e);
        }

        return null;
    }

    public static Dto toDto(String json) {
        return toObject(json, Dto.class);
    }
}
