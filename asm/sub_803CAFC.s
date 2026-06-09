	.syntax unified
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803CAFC, "ax", %progbits
@ sub_803CAFC @ JP 0x0803CAFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CAFC
	.thumb_func
sub_803CAFC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB14 @ =sub_803C7A8
	bl sub_803F9C0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB14: .4byte 0x0803C7A9  @ sub_803C7A8

