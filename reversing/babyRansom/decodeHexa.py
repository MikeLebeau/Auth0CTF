list = [
	"5f74306e7b425448",
	"33646431685f3073",
	"3077737334705f6e",
	"6472",
	"7d",
	"2d20392d2070697a",
	"502d2072",
	"6f6c2f706d742f20",
	"6c69665f64656b63",
	"635f726f665f7365",
	"65676e656c6c6168",
	"442f7e2070697a2e",
	"73746e656d75636f",
	"2a2f"
]

result = [];

for item in list:
	result.append(item.decode("hex")[::-1])
	print(item.decode("hex"))

print("".join(result))
