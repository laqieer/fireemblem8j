	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_8033168, 0x08033168 + 1
	.section .text.sub_800BF3C, "ax", %progbits
@ GetUnitStructFromEventParameter @ JP 0x0800BF3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitStructFromEventParameter
	.thumb_func
GetUnitStructFromEventParameter:
	push {lr}
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #3
	rsbs r2, r2, #0
	cmp r1, r2
	bge _0800BF4E
	movs r0, #0
	b _0800BFC2
_0800BF4E:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BF7C
	cmp r1, r0
	bgt _0800BF60
	cmp r1, r2
	beq _0800BF6E
	b _0800BFBC
_0800BF60:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BFA8
	cmp r1, #0
	beq _0800BFB4
	b _0800BFBC
_0800BF6E:
	ldr r0, _0800BF78 @ =0x030004B0
	movs r2, #8
	ldrsh r1, [r0, r2]
	b _0800BFBC
	.align 2, 0
_0800BF78: .4byte 0x030004B0
_0800BF7C:
	ldr r2, _0800BF9C @ =0x030004DE
	ldrh r1, [r2]
	ldr r0, _0800BFA0 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r2, #2
	ldrh r2, [r2]
	ldr r0, [r1]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800BFA4
	bl GetUnit
	b _0800BFC2
	.align 2, 0
_0800BF9C: .4byte 0x030004DE
_0800BFA0: .4byte 0x0202E4D4
_0800BFA4:
	movs r0, #0
	b _0800BFC2
_0800BFA8:
	ldr r0, _0800BFB0 @ =0x03004DF0
	ldr r0, [r0]
	b _0800BFC2
	.align 2, 0
_0800BFB0: .4byte 0x03004DF0
_0800BFB4:
	bl sub_8033168
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
_0800BFBC:
	adds r0, r1, #0
	bl GetUnitFromCharId
_0800BFC2:
	pop {r1}
	bx r1
	.align 2, 0

