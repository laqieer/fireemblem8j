	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80498A4, 0x080498A4 + 1
	.section .text.sub_804BC1C, "ax", %progbits
@ sub_804BC1C @ JP 0x0804BC1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BC1C
	.thumb_func
sub_804BC1C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0804BC54 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804BC5C
	bl sub_80498A4
	str r4, [r5, #0x58]
	ldr r0, _0804BC58 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804BC50
	movs r0, #0x68
	bl m4aSongNumStart
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_0804BC50:
	movs r0, #1
	b _0804BC5E
	.align 2, 0
_0804BC54: .4byte 0x085775CC
_0804BC58: .4byte 0x0202BCEC
_0804BC5C:
	movs r0, #0
_0804BC5E:
	pop {r4, r5}
	pop {r1}
	bx r1

