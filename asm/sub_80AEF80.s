	.syntax unified
	.set sub_80AF1CC, 0x080AF1CC + 1
	.section .text.sub_80AEF80, "ax", %progbits
@ sub_80AEF80 @ JP 0x080AEF80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEF80
	.thumb_func
sub_80AEF80:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080AEF92
	adds r0, r1, #0
	bl sub_80AF1CC
_080AEF92:
	pop {r0}
	bx r0
	.align 2, 0

