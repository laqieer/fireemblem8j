	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8089B58, 0x08089B58 + 1
	.section .text.sub_8089C68, "ax", %progbits
@ sub_8089C68 @ JP 0x08089C68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089C68
	.thumb_func
sub_8089C68:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08089CDC @ =0x02022D40
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _08089CE0 @ =0x02023D40
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl j_TmFillRect
	ldr r7, _08089CE4 @ =0x08A728D4
	adds r4, r6, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0x7f
	bne _08089CB4
	adds r0, r6, #0
	adds r0, #0x4a
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_8089B58
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	movs r5, #0
	ldrsb r5, [r0, r5]
_08089CB4:
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08089CC4
	rsbs r5, r5, #0
_08089CC4:
	adds r2, r5, #0
	cmp r5, #0
	bge _08089CCC
	rsbs r2, r5, #0
_08089CCC:
	movs r0, #0x12
	subs r7, r0, r2
	cmp r5, #0
	bge _08089CE8
	movs r4, #0
	rsbs r0, r5, #0
	b _08089CEC
	.align 2, 0
_08089CDC: .4byte 0x02022D40
_08089CE0: .4byte 0x02023D40
_08089CE4: .4byte 0x08A728D4
_08089CE8:
	adds r4, r5, #0
	movs r0, #0
_08089CEC:
	lsls r5, r0, #1
	ldr r0, _08089D44 @ =0x02003D2C
	adds r0, r5, r0
	lsls r4, r4, #1
	ldr r1, _08089D48 @ =0x02022D40
	adds r1, r4, r1
	adds r2, r7, #0
	movs r3, #0x12
	bl j_TmCopyRect
	ldr r0, _08089D4C @ =0x0200472C
	adds r5, r5, r0
	ldr r0, _08089D50 @ =0x02023D40
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0x12
	bl j_TmCopyRect
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08089D54 @ =0x08A728D4
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r0, r0, r2
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08089D3E
	adds r0, r6, #0
	bl sub_8002DE4
_08089D3E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089D44: .4byte 0x02003D2C
_08089D48: .4byte 0x02022D40
_08089D4C: .4byte 0x0200472C
_08089D50: .4byte 0x02023D40
_08089D54: .4byte 0x08A728D4

