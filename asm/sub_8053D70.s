	.syntax unified
	.set CheckEkrDragonDead, 0x080727C4 + 1
	.set CheckEkrDragonSkipTransfer, 0x080727E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8053E94, 0x08053E94 + 1
	.set sub_8053F7C, 0x08053F7C + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_8053D70, "ax", %progbits
@ sub_8053D70 @ JP 0x08053D70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053D70
	.thumb_func
sub_8053D70:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne _08053DE6
	adds r0, r5, #0
	bl CheckEkrDragonDead
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08053E02
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonSkipTransfer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08053DC2
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_8053F7C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl sub_8073F94
	movs r0, #0x64
	strh r0, [r4, #0x2e]
	b _08053E02
_08053DC2:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_8053E94
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl sub_8073E74
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r0, #0xd6
	movs r2, #1
	bl sub_8073F94
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b _08053E02
_08053DE6:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08053E02
	ldr r1, _08053E08 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _08053E0C @ =0x02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08053E02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053E08: .4byte 0x02017728
_08053E0C: .4byte 0x02017734

