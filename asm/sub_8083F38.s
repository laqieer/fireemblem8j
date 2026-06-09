	.syntax unified
	.set sub_807FEEC, 0x0807FEEC + 1
	.section .text.sub_8083F38, "ax", %progbits
@ sub_8083F38 @ JP 0x08083F38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083F38
	.thumb_func
sub_8083F38:
	push {lr}
	ldr r2, _08083F54 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807FEEC
	pop {r0}
	bx r0
	.align 2, 0
_08083F54: .4byte 0x0203E1EC

