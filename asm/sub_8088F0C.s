	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8088F0C, "ax", %progbits
@ sub_8088F0C @ JP 0x08088F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088F0C
	.thumb_func
sub_8088F0C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	asrs r6, r3, #0x18
	ldr r7, _08088F44 @ =0x020244A8
	cmp r4, #0
	bne _08088F2E
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_08088F2E:
	cmp r5, #0
	bge _08088F34
	movs r5, #0xe
_08088F34:
	cmp r6, #0
	beq _08088F4C
	ldr r0, _08088F48 @ =0x08BB059C
	lsls r1, r5, #5
	movs r2, #0x40
	bl sub_8000D68
	b _08088F56
	.align 2, 0
_08088F44: .4byte 0x020244A8
_08088F48: .4byte 0x08BB059C
_08088F4C:
	ldr r0, _08088F94 @ =0x08BB059C
	lsls r1, r5, #5
	movs r2, #0x40
	bl sub_8000D68
_08088F56:
	ldr r0, _08088F98 @ =0x08BABE04
	adds r1, r4, #0
	bl sub_8013008
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _08088F9C @ =0x0000027F
_08088F76:
	adds r0, r2, r1
	strh r0, [r7]
	adds r7, #2
	adds r2, #1
	cmp r2, r3
	ble _08088F76
	ldr r0, _08088FA0 @ =0x08A7279C
	mov r1, r8
	bl sub_8002BCC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08088F94: .4byte 0x08BB059C
_08088F98: .4byte 0x08BABE04
_08088F9C: .4byte 0x0000027F
_08088FA0: .4byte 0x08A7279C

