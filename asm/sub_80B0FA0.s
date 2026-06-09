	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B0FA0, "ax", %progbits
@ sub_80B0FA0 @ JP 0x080B0FA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0FA0
	.thumb_func
sub_80B0FA0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r2, #0
	ldr r7, _080B0FD8 @ =0x020228A8
	ldr r0, _080B0FDC @ =0x08AA52DC
	mov r8, r0
	lsls r0, r3, #6
	ldr r1, _080B0FE0 @ =0x000002A2
	adds r0, r0, r1
	adds r6, r0, r7
	lsls r1, r3, #6
	ldr r0, _080B0FE4 @ =0x000002C2
	adds r4, r7, r0
	ldr r0, _080B0FE8 @ =0x08AA7116
	adds r5, r1, r0
_080B0FCA:
	cmp r2, r3
	bne _080B0FEC
	ldrh r0, [r5]
	strh r0, [r6]
	lsls r1, r2, #5
	b _080B0FF8
	.align 2, 0
_080B0FD8: .4byte 0x020228A8
_080B0FDC: .4byte 0x08AA52DC
_080B0FE0: .4byte 0x000002A2
_080B0FE4: .4byte 0x000002C2
_080B0FE8: .4byte 0x08AA7116
_080B0FEC:
	lsls r0, r2, #6
	ldr r1, _080B1028 @ =0x08AA7136
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	lsls r1, r3, #5
_080B0FF8:
	adds r4, #0x40
	adds r2, #1
	cmp r2, #2
	ble _080B0FCA
	movs r0, #0x3f
	mov r2, ip
	ands r0, r2
	lsrs r0, r0, #2
	ldr r2, _080B102C @ =0x00000151
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	bl sub_8001EE4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1028: .4byte 0x08AA7136
_080B102C: .4byte 0x00000151

