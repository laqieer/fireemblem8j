	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8000CE4, 0x08000CE4 + 1
	.set sub_8037FDC, 0x08037FDC + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80393D8, "ax", %progbits
@ sub_80393D8 @ JP 0x080393D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80393D8
	.thumb_func
sub_80393D8:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, _08039424 @ =0x03001798
	ldr r2, _08039428 @ =0x04000003
	adds r0, r4, #0
	mov r1, sp
	bl sub_80D6370
	bl sub_8000CD8
	adds r5, r0, #0
	ldr r0, _0803942C @ =0x020038C4
	ldr r0, [r0]
	bl sub_8000CE4
	mov r0, sp
	bl sub_8037FDC
	adds r0, r5, #0
	bl sub_8000CE4
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r4, r0, r4
	cmp r6, #4
	bhi _080394AA
	lsls r0, r6, #2
	ldr r1, _08039430 @ =_08039434
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039424: .4byte 0x03001798
_08039428: .4byte 0x04000003
_0803942C: .4byte 0x020038C4
_08039430: .4byte _08039434
_08039434: @ jump table
	.4byte _08039452 @ case 0
	.4byte _08039448 @ case 1
	.4byte _08039456 @ case 2
	.4byte _0803946C @ case 3
	.4byte _08039490 @ case 4
_08039448:
	mov r0, sp
	ldrh r0, [r0]
	ldrh r4, [r4]
	cmp r0, r4
	bls _080394AA
_08039452:
	movs r0, #1
	b _080394AC
_08039456:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _08039452
	mov r0, sp
	ldrb r0, [r0, #2]
	ldrb r4, [r4, #2]
	cmp r0, r4
	bhs _080394AA
	b _08039452
_0803946C:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _08039452
	mov r0, sp
	ldrb r3, [r0, #3]
	ldrb r1, [r0, #4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r3
	ldrb r3, [r4, #3]
	ldrb r0, [r4, #4]
	ands r0, r2
	lsls r0, r0, #8
	orrs r0, r3
	b _080394A6
_08039490:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _08039452
	ldr r1, [sp, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	ldr r0, [r4, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
_080394A6:
	cmp r1, r0
	blt _08039452
_080394AA:
	movs r0, #0
_080394AC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

