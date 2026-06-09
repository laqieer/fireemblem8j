	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8088FA4, "ax", %progbits
@ sub_8088FA4 @ JP 0x08088FA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088FA4
	.thumb_func
sub_8088FA4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r5, _08089064 @ =0x020244A8
	cmp r6, #0
	bne _08088FC6
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r6, r0, r1
_08088FC6:
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	ldr r1, _08089068 @ =0x08BB059C
	adds r0, r0, r1
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _0808906C @ =0x08BABE04
	adds r1, r6, #0
	bl sub_8013008
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r6, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r1, r0, r1
	movs r4, #0
	lsls r2, r7, #5
	add r7, r8
	cmp r4, r2
	bge _08089008
_08088FFC:
	adds r0, r4, r1
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r2
	blt _08088FFC
_08089008:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r6, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf0
	lsls r1, r1, #8
	adds r1, r0, r1
	lsls r2, r7, #5
	cmp r4, r2
	bge _0808902C
_08089020:
	adds r0, r4, r1
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r2
	blt _08089020
_0808902C:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r6, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r1, r0, r1
	ldr r2, _08089070 @ =0x0000027F
	cmp r4, r2
	bgt _08089050
_08089044:
	adds r0, r4, r1
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r2
	ble _08089044
_08089050:
	ldr r0, _08089074 @ =0x08A7279C
	mov r1, sb
	bl sub_8002BCC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089064: .4byte 0x020244A8
_08089068: .4byte 0x08BB059C
_0808906C: .4byte 0x08BABE04
_08089070: .4byte 0x0000027F
_08089074: .4byte 0x08A7279C

