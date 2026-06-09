	.syntax unified
	.set sub_8077394, 0x08077394 + 1
	.section .text.sub_8051078, "ax", %progbits
@ sub_8051078 @ JP 0x08051078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051078
	.thumb_func
sub_8051078:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08051090 @ =0x0203E190
	ldr r0, [r0]
	cmp r0, #0
	beq _0805109C
	ldr r0, _08051094 @ =0x02000000
	ldr r0, [r0, #8]
	bl sub_8077394
	ldr r0, _08051098 @ =sub_80510AC
	b _0805109E
	.align 2, 0
_08051090: .4byte 0x0203E190
_08051094: .4byte 0x02000000
_08051098: .4byte 0x080510AD  @ sub_80510AC
_0805109C:
	ldr r0, _080510A8 @ =ekrBattleTriggerNewRoundStart
_0805109E:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080510A8: .4byte 0x080510D5  @ ekrBattleTriggerNewRoundStart

