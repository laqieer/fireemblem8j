	.syntax unified
	.section .text.GetOverallRank, "ax", %progbits
@ GetOverallRank @ JP 0x080BABF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetOverallRank
	.thumb_func
GetOverallRank:
	push {r4, r5, r6, lr}
	ldr r5, [sp, #0x10]
	ldr r4, _080BAC44 @ =0x08AC033C
	adds r0, r0, r4
	ldrb r6, [r0]
	adds r0, r4, #5
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0xa
	adds r2, r2, r1
	adds r0, r6, r0
	ldrb r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	adds r1, #5
	adds r3, r3, r1
	lsrs r0, r0, #0x10
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	adds r4, #0x14
	adds r5, r5, r4
	lsrs r0, r0, #0x10
	ldrb r5, [r5]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	ldr r1, _080BAC48 @ =0x08AC0356
_080BAC30:
	ldrh r2, [r1]
	cmp r6, r2
	blo _080BAC3E
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080BAC30
_080BAC3E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BAC44: .4byte 0x08AC033C
_080BAC48: .4byte 0x08AC0356

