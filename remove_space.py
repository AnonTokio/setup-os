import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-f", "--file")
    args = parser.parse_args()

    filename = args.file
    content: list[str] = []
    with open(filename, "r", encoding="utf8") as f:
        for line in f.readlines():
            content.append(line.strip())

    content.sort()
    with open(filename, "w", encoding="utf8") as f:
        f.write("\n".join(content) + "\n")


if __name__ == "__main__":
    main()
