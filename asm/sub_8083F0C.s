	.syntax unified
	.set sub_807FDEC, 0x0807FDEC + 1
	.section .text.sub_8083F0C, "ax", %progbits
@ sub_8083F0C @ JP 0x08083F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083F0C
	.thumb_func
sub_8083F0C:
	push {lr}
	ldr r2, _08083F34 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x60
	ldrb r1, [r1]
	adds r2, #0x61
	ldrb r2, [r2]
	bl sub_807FDEC
	pop {r0}
	bx r0
	.align 2, 0
_08083F34: .4byte 0x0203E1EC

