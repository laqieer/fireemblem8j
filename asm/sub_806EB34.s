	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806EB34, "ax", %progbits
@ sub_806EB34 @ JP 0x0806EB34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EB34
	.thumb_func
sub_806EB34:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806EB58 @ =0x086033F4
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806EB5C @ =0x080E4484
	str r1, [r0, #0x48]
	ldr r1, _0806EB60 @ =0x08614CE0
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB58: .4byte 0x086033F4
_0806EB5C: .4byte 0x080E4484
_0806EB60: .4byte 0x08614CE0

