	.syntax unified
	.section .text.sub_800FCA0, "ax", %progbits
@ sub_800FCA0 @ JP 0x0800FCA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FCA0
	.thumb_func
sub_800FCA0:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	adds r4, r2, #0
	movs r0, #2
	ldrsh r1, [r1, r0]
	cmp r1, #0
	bge _0800FCBC
	ldr r0, _0800FCCC @ =0x030004B0
	movs r5, #8
	ldrsh r1, [r0, r5]
_0800FCBC:
	cmp r2, #1
	beq _0800FCDE
	cmp r2, #1
	bgt _0800FCD0
	cmp r2, #0
	beq _0800FCD6
	b _0800FCFC
	.align 2, 0
_0800FCCC: .4byte 0x030004B0
_0800FCD0:
	cmp r4, #2
	beq _0800FCF0
	b _0800FCFC
_0800FCD6:
	adds r0, r3, #0
	adds r0, #0x4c
	strh r1, [r0]
	b _0800FCFC
_0800FCDE:
	cmp r1, #0
	bge _0800FCE4
	movs r1, #0
_0800FCE4:
	cmp r1, #0x64
	ble _0800FCEA
	movs r1, #0x64
_0800FCEA:
	adds r0, r3, #0
	adds r0, #0x4e
	b _0800FCFA
_0800FCF0:
	adds r0, r3, #0
	adds r0, #0x4f
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
_0800FCFA:
	strb r1, [r0]
_0800FCFC:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

