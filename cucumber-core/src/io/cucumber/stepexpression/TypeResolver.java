package io.cucumber.stepexpression;

import java.lang.reflect.Type;

/**
 * Allows lazy resolution of the type of a data table or doc string.
 */
public interface TypeResolver {

    /**
     * A type to data convert the table or doc string to. May not return null.
     * <p>
     * When the {@link Object} type is returned no transform will be applied.
     *
     * @return a type
     */
    Type resolve();

}
