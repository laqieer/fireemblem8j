	.syntax unified
	.section .text.GetOverallRankFrom3, "ax", %progbits
@ GetOverallRankFrom3 @ JP 0x080BAC4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetOverallRankFrom3
	.thumb_func
GetOverallRankFrom3:
	push {r4, lr}
	ldr r3, _080BAC80 @ =0x08AC0362
	adds r0, r0, r3
	ldrb r4, [r0]
	adds r0, r3, #5
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r3, #0xa
	adds r2, r2, r3
	adds r0, r4, r0
	ldrb r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	ldr r1, _080BAC84 @ =0x08AC0372
_080BAC6C:
	ldrh r2, [r1]
	cmp r4, r2
	blo _080BAC7A
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080BAC6C
_080BAC7A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BAC80: .4byte 0x08AC0362
_080BAC84: .4byte 0x08AC0372

