	.syntax unified
	.set NewEkrNamewinAppear, 0x08057D98 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8057CAC, 0x08057CAC + 1
	.section .text.sub_8053B6C, "ax", %progbits
@ sub_8053B6C @ JP 0x08053B6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053B6C
	.thumb_func
sub_8053B6C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08053B96
	movs r0, #1
	movs r1, #7
	bl sub_8057CAC
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl sub_8002DE4
_08053B96:
	pop {r4}
	pop {r0}
	bx r0

