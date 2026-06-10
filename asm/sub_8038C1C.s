	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8000CE4, 0x08000CE4 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8037FDC, 0x08037FDC + 1
	.set sub_8038574, 0x08038574 + 1
	.set sub_80385E8, 0x080385E8 + 1
	.set sub_80387B8, 0x080387B8 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8038C1C, "ax", %progbits
@ sub_8038C1C @ JP 0x08038C1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038C1C
	.thumb_func
sub_8038C1C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r6, r0, #0
	ldr r4, _08038E90 @ =0x03001798
	ldr r5, _08038E94 @ =0x04000003
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_80D6370
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r0, r0, r4
	add r1, sp, #0x14
	mov sb, r1
	adds r2, r5, #0
	bl sub_80D6370
	bl sub_8000CD8
	adds r4, r0, #0
	ldr r0, _08038E98 @ =0x020038C4
	ldr r0, [r0]
	bl sub_8000CE4
	add r0, sp, #8
	bl sub_8037FDC
	adds r0, r4, #0
	bl sub_8000CE4
	bl ResetTextFont
	ldr r4, _08038E9C @ =0x020038AC
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _08038EA0 @ =0x06000020
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl sub_8003BE8
	adds r0, r4, #0
	bl SetTextFont
	bl sub_80042E0
	adds r0, r6, #0
	bl sub_80048B4
	add r0, sp, #0x20
	bl sub_8038574
	ldr r0, _08038EA4 @ =0x02003B70
	mov r3, sb
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x19
	movs r6, #7
	str r6, [sp]
	movs r4, #2
	mov r8, r4
	str r4, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl sub_80385E8
	ldr r7, _08038EA8 @ =0x080DCD04
	ldrb r2, [r7, #4]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r1, _08038EAC @ =0x020038C8
	mov sl, r1
	add r0, sl
	add r1, sp, #8
	ldrh r3, [r1, #6]
	lsrs r3, r3, #3
	ldrb r1, [r1, #8]
	ands r1, r6
	lsls r1, r1, #0xd
	orrs r1, r3
	movs r3, #0
	ldrsb r3, [r7, r3]
	movs r4, #1
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80385E8
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r1, sb
	ldrh r3, [r1, #6]
	lsrs r3, r3, #3
	ldrb r1, [r1, #8]
	ands r1, r6
	lsls r1, r1, #0xd
	orrs r1, r3
	adds r3, r7, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, r7, #0
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80385E8
	ldrb r2, [r7, #0xc]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x40
	adds r0, r0, r1
	add r1, sp, #8
	ldrh r1, [r1]
	movs r3, #8
	ldrsb r3, [r7, r3]
	movs r4, #9
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r6, r8
	str r6, [sp, #4]
	bl sub_80385E8
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xc0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r3, sb
	ldrh r1, [r3]
	adds r3, r7, #0
	adds r3, #0x2c
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, r7, #0
	adds r4, #0x2d
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	bl sub_80385E8
	ldrb r2, [r7, #0x14]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x80
	adds r0, r0, r1
	add r1, sp, #8
	ldrb r1, [r1, #2]
	movs r3, #0x10
	ldrsb r3, [r7, r3]
	adds r4, r7, #0
	adds r4, #0x35
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	bl sub_80385E8
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r6, sb
	ldrb r1, [r6, #2]
	adds r3, r7, #0
	adds r3, #0x34
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80385E8
	ldrb r2, [r7, #0x1c]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0xc0
	adds r0, r0, r1
	add r1, sp, #8
	ldrb r3, [r1, #3]
	ldrb r1, [r1, #4]
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #8
	orrs r1, r3
	movs r3, #0x18
	ldrsb r3, [r7, r3]
	movs r4, #0x19
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80385E8
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r2, [r0]
	subs r5, r5, r2
	lsls r5, r5, #3
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	adds r5, r5, r0
	mov r1, sb
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #4]
	ands r1, r6
	lsls r1, r1, #8
	orrs r1, r0
	adds r0, r7, #0
	adds r0, #0x3c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl sub_80385E8
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [sp, #0xc]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	adds r2, r7, #0
	adds r2, #0x20
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r7, #0
	adds r3, #0x21
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	bl sub_80387B8
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, sl
	mov r2, sb
	ldr r1, [r2, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	adds r2, r7, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r7, #0
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	bl sub_80387B8
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038E90: .4byte 0x03001798
_08038E94: .4byte 0x04000003
_08038E98: .4byte 0x020038C4
_08038E9C: .4byte 0x020038AC
_08038EA0: .4byte 0x06000020
_08038EA4: .4byte 0x02003B70
_08038EA8: .4byte 0x080DCD04
_08038EAC: .4byte 0x020038C8

