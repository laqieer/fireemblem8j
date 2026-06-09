	.syntax unified
	.section .text.GetWorldMapNodeIdByOrder, "ax", %progbits
@ GetWorldMapNodeIdByOrder @ JP 0x080C0890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetWorldMapNodeIdByOrder
	.thumb_func
GetWorldMapNodeIdByOrder:
	push {lr}
	adds r3, r0, #0
	ldr r0, _080C08A4 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080C08A0
	cmp r0, #3
	beq _080C08A8
_080C08A0:
	movs r2, #0
	b _080C08AA
	.align 2, 0
_080C08A4: .4byte 0x0202BCEC
_080C08A8:
	movs r2, #1
_080C08AA:
	ldr r0, _080C08C0 @ =0x081F611C
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, r3, r1
	adds r1, r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_080C08C0: .4byte 0x081F611C

