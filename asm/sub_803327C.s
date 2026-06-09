	.syntax unified
	.set TrySwitchViewedUnit, 0x0801D7B0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_803325C, 0x0803325C + 1
	.section .text.sub_803327C, "ax", %progbits
@ sub_803327C @ JP 0x0803327C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803327C
	.thumb_func
sub_803327C:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	str r0, [r5, #0x58]
	ldr r4, _080332B0 @ =0x0202BCAC
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl TrySwitchViewedUnit
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl sub_8015AB4
	adds r0, r5, #0
	bl sub_8002DE4
	bl sub_803325C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080332B0: .4byte 0x0202BCAC

