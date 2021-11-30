const stringIsNullOrWhiteSpace = (value: string): boolean => {
  if (!value) return true;

  value = value.trim();

  if (value === "" || value === null) {
    return true;
  }

  return false;
};

export default stringIsNullOrWhiteSpace;
