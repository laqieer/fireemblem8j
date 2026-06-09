	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.section .text.GetUnitStaffReachBits, "ax", %progbits
@ GetUnitStaffReachBits @ JP 0x080170A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitStaffReachBits
	.thumb_func
GetUnitStaffReachBits:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	movs r5, #0
	ldrh r4, [r7, #0x1e]
	cmp r4, #0
	beq _080170F4
_080170AE:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080170E0
	movs r1, #0xff
	ands r1, r4
	cmp r1, #0xa6
	beq _080170D8
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017104 @ =0x0885E068
	adds r0, r0, r1
	ldrb r0, [r0, #0x19]
	movs r4, #0xf
	ands r4, r0
	cmp r4, #0
	bne _080170DA
_080170D8:
	movs r4, #0x63
_080170DA:
	cmp r6, r4
	bge _080170E0
	adds r6, r4, #0
_080170E0:
	adds r5, #1
	cmp r5, #4
	bgt _080170F4
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080170AE
_080170F4:
	cmp r6, #2
	beq _08017112
	cmp r6, #2
	bgt _08017108
	cmp r6, #1
	beq _0801710E
	b _0801711A
	.align 2, 0
_08017104: .4byte 0x0885E068
_08017108:
	cmp r6, #0x63
	beq _08017116
	b _0801711A
_0801710E:
	movs r0, #1
	b _0801711C
_08017112:
	movs r0, #3
	b _0801711C
_08017116:
	movs r0, #0x20
	b _0801711C
_0801711A:
	movs r0, #0
_0801711C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

