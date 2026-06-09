	.syntax unified
	.set sub_807F818, 0x0807F818 + 1
	.section .text.sub_8083D48, "ax", %progbits
@ sub_8083D48 @ JP 0x08083D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083D48
	.thumb_func
sub_8083D48:
	push {lr}
	ldr r2, _08083D64 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807F818
	pop {r0}
	bx r0
	.align 2, 0
_08083D64: .4byte 0x0203E1EC

