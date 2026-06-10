	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_802FFAC, "ax", %progbits
@ sub_802FFAC @ JP 0x0802FFAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FFAC
	.thumb_func
sub_802FFAC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0802FFEA
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802FFC6
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _0802FFEA
_0802FFC6:
	ldr r2, [r4, #0x30]
	ldrh r0, [r2]
	strh r0, [r4, #0x34]
	ldr r0, [r2, #4]
	ldr r1, _0802FFF0 @ =0x0600A000
	ldrh r2, [r2, #2]
	lsrs r2, r2, #2
	bl sub_80D636C
	ldr r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _0802FFEA
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x30]
_0802FFEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FFF0: .4byte 0x0600A000

