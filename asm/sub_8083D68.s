	.syntax unified
	.set sub_807F9CC, 0x0807F9CC + 1
	.section .text.sub_8083D68, "ax", %progbits
@ sub_8083D68 @ JP 0x08083D68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083D68
	.thumb_func
sub_8083D68:
	push {lr}
	ldr r2, _08083D88 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08083D8C @ =0x08A1EE8C
	ldr r2, _08083D90 @ =0x08A1FFB8
	bl sub_807F9CC
	pop {r0}
	bx r0
	.align 2, 0
_08083D88: .4byte 0x0203E1EC
_08083D8C: .4byte 0x08A1EE8C
_08083D90: .4byte 0x08A1FFB8

