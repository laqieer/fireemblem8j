	.syntax unified
	.set sub_807F9CC, 0x0807F9CC + 1
	.section .text.sub_8083D94, "ax", %progbits
@ sub_8083D94 @ JP 0x08083D94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083D94
	.thumb_func
sub_8083D94:
	push {lr}
	ldr r2, _08083DB4 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08083DB8 @ =0x08A1EE8C
	ldr r2, _08083DBC @ =0x08A1FF98
	bl sub_807F9CC
	pop {r0}
	bx r0
	.align 2, 0
_08083DB4: .4byte 0x0203E1EC
_08083DB8: .4byte 0x08A1EE8C
_08083DBC: .4byte 0x08A1FF98

