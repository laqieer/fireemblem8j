	.syntax unified
	.section .text.ekrBattleTriggerNewRoundStart, "ax", %progbits
@ ekrBattleTriggerNewRoundStart @ JP 0x080510D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ekrBattleTriggerNewRoundStart
	.thumb_func
ekrBattleTriggerNewRoundStart:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r1, #0
	mov ip, r1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08051148
	ldr r6, _08051150 @ =0x0203E100
	movs r7, #0
	ldrsh r0, [r6, r7]
	cmp r0, #1
	bne _08051114
	ldr r3, _08051154 @ =0x02000000
	ldr r4, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	movs r7, #0x80
	lsls r7, r7, #7
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #4]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_08051114:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _0805113C
	ldr r3, _08051154 @ =0x02000000
	ldr r4, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #0xc]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_0805113C:
	ldr r0, _08051158 @ =0x0201FB04
	mov r7, ip
	str r7, [r0]
	str r7, [r0, #4]
	ldr r0, _0805115C @ =ekrBattle_2
	str r0, [r5, #0xc]
_08051148:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051150: .4byte 0x0203E100
_08051154: .4byte 0x02000000
_08051158: .4byte 0x0201FB04
_0805115C: .4byte 0x08051161  @ ekrBattle_2

