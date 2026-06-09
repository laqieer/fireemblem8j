	.syntax unified
	.set sub_807F3F8, 0x0807F3F8 + 1
	.section .text.sub_8083D28, "ax", %progbits
@ sub_8083D28 @ JP 0x08083D28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083D28
	.thumb_func
sub_8083D28:
	push {lr}
	ldr r2, _08083D44 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807F3F8
	pop {r0}
	bx r0
	.align 2, 0
_08083D44: .4byte 0x0203E1EC

