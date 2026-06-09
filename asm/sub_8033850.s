	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_801DA74, 0x0801DA74 + 1
	.set sub_80331E0, 0x080331E0 + 1
	.section .text.sub_8033850, "ax", %progbits
@ sub_8033850 @ JP 0x08033850 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033850
	.thumb_func
sub_8033850:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_801DA74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803386E
	ldr r0, [r4, #0x58]
	cmp r0, #2
	bne _08033868
	bl sub_80331E0
_08033868:
	adds r0, r4, #0
	bl sub_8002DE4
_0803386E:
	ldr r1, _08033884 @ =0x0202BCAC
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl sub_8015AB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033884: .4byte 0x0202BCAC

