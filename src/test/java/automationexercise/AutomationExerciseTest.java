package automationexercise;

import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;

import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;

public class AutomationExerciseTest {

    @Test
    void runAll() {
        SuiteResult result = Runner.path("classpath:automationexercise")
                .outputHtmlReport(true)
                .parallel(1);

        result.printSummary();
        assertTrue(result.isPassed(), result.toJsonPretty());
    }
}