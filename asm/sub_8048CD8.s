	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043190, 0x08043190 + 1
	.section .text.sub_8048CD8, "ax", %progbits
@ sub_8048CD8 @ JP 0x08048CD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048CD8
	.thumb_func
sub_8048CD8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	ldr r0, _08048D4C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08048CFC
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _08048CFC
	subs r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl sub_8043190
_08048CFC:
	ldr r0, _08048D4C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08048D1A
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bgt _08048D1A
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl sub_8043190
_08048D1A:
	ldr r0, _08048D4C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08048D5A
	ldr r0, _08048D50 @ =0x02000C04
	adds r0, #1
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08048D54
	movs r0, #2
	bl sub_8043190
	str r6, [r4, #0x50]
	ldr r0, [r4, #0x44]
	str r0, [r5, #0x60]
	adds r0, r5, #0
	bl sub_8002DE4
	b _08048D5A
	.align 2, 0
_08048D4C: .4byte 0x085775CC
_08048D50: .4byte 0x02000C04
_08048D54:
	movs r0, #0
	bl sub_8043190
_08048D5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

