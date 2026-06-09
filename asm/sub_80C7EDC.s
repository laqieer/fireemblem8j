	.syntax unified
	.set GmMu_FinishMovement, 0x080C3118 + 1
	.set GmMu_IsMoving, 0x080C2F14 + 1
	.set HideGmUnit, 0x080C4354 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C02AC, 0x080C02AC + 1
	.set sub_80C3144, 0x080C3144 + 1
	.section .text.sub_80C7EDC, "ax", %progbits
@ sub_80C7EDC @ JP 0x080C7EDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7EDC
	.thumb_func
sub_80C7EDC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080C7F28 @ =0x08AC1108
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	bl GmMu_IsMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7F04
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	bl GmMu_FinishMovement
_080C7F04:
	bl sub_80C02AC
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C7F16
	cmp r0, #1
	beq _080C7F30
_080C7F16:
	ldr r1, _080C7F2C @ =0x03005270
	ldrh r0, [r4, #0x2c]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x34
	ldrb r1, [r1]
	strb r1, [r0, #0x11]
	b _080C7F46
	.align 2, 0
_080C7F28: .4byte 0x08AC1108
_080C7F2C: .4byte 0x03005270
_080C7F30:
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl sub_80C3144
_080C7F46:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C7F5A
	ldrh r0, [r4, #0x2c]
	bl HideGmUnit
_080C7F5A:
	pop {r4, r5}
	pop {r0}
	bx r0

