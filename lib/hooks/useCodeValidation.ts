import { useState } from 'react';
import { codeService, CodeValidationResult } from '../services/codeService';

export const useCodeValidation = () => {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const validateCodes = async (codes: string[]): Promise<CodeValidationResult> => {
    setLoading(true);
    setError(null);

    try {
      const result = await codeService.validateCodes(codes);
      
      if (!result.isValid) {
        setError(result.error || 'Validation failed');
      }
      
      return result;
    } catch (err) {
      const errorMessage = 'Failed to validate codes';
      setError(errorMessage);
      return { isValid: false, error: errorMessage };
    } finally {
      setLoading(false);
    }
  };

  return { validateCodes, loading, error };
};
