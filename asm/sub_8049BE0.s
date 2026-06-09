	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8049B2C, 0x08049B2C + 1
	.section .text.sub_8049BE0, "ax", %progbits
@ sub_8049BE0 @ JP 0x08049BE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049BE0
	.thumb_func
sub_8049BE0:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	adds r5, r0, #0
	movs r0, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl sub_8049B2C
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq _08049C3E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r1, [r0]
	ldr r0, _08049C70 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08049C3E
	ldr r0, _08049C74 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08049C3E
	movs r0, #0x80
	bl m4aSongNumStart
_08049C3E:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls _08049C66
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r1, _08049C78 @ =0x0203DD8C
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r1, [r4, #0x38]
	str r1, [r0]
	adds r0, r4, #0
	bl sub_8002DE4
_08049C66:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049C70: .4byte 0x085D31E8
_08049C74: .4byte 0x0202BCEC
_08049C78: .4byte 0x0203DD8C

