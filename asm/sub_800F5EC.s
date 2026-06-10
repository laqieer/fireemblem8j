	.syntax unified
	.set SetWeather, 0x08030BCC + 1
	.section .text.sub_800F5EC, "ax", %progbits
@ sub_800F5EC @ JP 0x0800F5EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F5EC
	.thumb_func
sub_800F5EC:
	push {lr}
	ldr r0, [r0, #0x38]
	ldrh r0, [r0, #2]
	bl SetWeather
	movs r0, #2
	pop {r1}
	bx r1

