	.syntax unified
	.section .text.WfxBlueHSync, "ax", %progbits
@ WfxBlueHSync @ JP 0x080305C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxBlueHSync
	.thumb_func
WfxBlueHSync:
	push {lr}
	ldr r0, _080305F8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080305D6
	movs r3, #0
_080305D6:
	ldr r0, _080305FC @ =0x0202BCAC
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08030600 @ =0x0000013F
	cmp r3, r0
	bls _08030604
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	b _08030612
	.align 2, 0
_080305F8: .4byte 0x04000006
_080305FC: .4byte 0x0202BCAC
_08030600: .4byte 0x0000013F
_08030604:
	movs r2, #0xa0
	lsls r2, r2, #0x13
	lsls r0, r3, #1
	ldr r1, _08030618 @ =0x02002ADC
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_08030612:
	pop {r0}
	bx r0
	.align 2, 0
_08030618: .4byte 0x02002ADC

