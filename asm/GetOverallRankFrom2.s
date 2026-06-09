	.syntax unified
	.section .text.GetOverallRankFrom2, "ax", %progbits
@ GetOverallRankFrom2 @ JP 0x080BAD80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetOverallRankFrom2
	.thumb_func
GetOverallRankFrom2:
	push {lr}
	ldr r2, _080BADA8 @ =0x08AC037E
	adds r0, r0, r2
	ldrb r3, [r0]
	adds r2, #5
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r3, r3, r0
	movs r0, #0
	ldr r1, _080BADAC @ =0x08AC0388
_080BAD94:
	ldrh r2, [r1]
	cmp r3, r2
	blo _080BADA2
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080BAD94
_080BADA2:
	pop {r1}
	bx r1
	.align 2, 0
_080BADA8: .4byte 0x08AC037E
_080BADAC: .4byte 0x08AC0388

