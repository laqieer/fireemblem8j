	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013608, 0x08013608 + 1
	.section .text.sub_8008F3C, "ax", %progbits
@ sub_8008F3C @ JP 0x08008F3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008F3C
	.thumb_func
sub_8008F3C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	adds r2, r1, r0
	str r2, [r4, #0x3c]
	cmp r2, #0xff
	bgt _08008F78
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r2
	lsls r3, r0, #8
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r0, r3, r0
	cmp r0, #0
	bge _08008F60
	adds r0, #0xff
_08008F60:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r1, r3, r0
	cmp r1, #0
	bge _08008F6E
	adds r1, #0xff
_08008F6E:
	asrs r1, r1, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r3, r0
	b _08008FA8
_08008F78:
	movs r0, #0x80
	lsls r0, r0, #2
	subs r3, r0, r2
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, _08008FD8 @ =0xFFFFFF00
	adds r0, r2, r5
	lsls r2, r0, #8
	adds r0, r1, r2
	cmp r0, #0
	bge _08008F92
	adds r0, #0xff
_08008F92:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r3, r0
	adds r0, r0, r2
	cmp r0, #0
	bge _08008FA0
	adds r0, #0xff
_08008FA0:
	asrs r1, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r3, r0
	adds r0, r0, r2
_08008FA8:
	cmp r0, #0
	bge _08008FAE
	adds r0, #0xff
_08008FAE:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r5, #0
	bl sub_8013608
	ldr r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _08008FDC
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bgt _08008FE8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_8002DE4
	b _08008FE8
	.align 2, 0
_08008FD8: .4byte 0xFFFFFF00
_08008FDC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _08008FE8
	movs r0, #0
	str r0, [r4, #0x3c]
_08008FE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

