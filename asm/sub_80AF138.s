	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.section .text.sub_80AF138, "ax", %progbits
@ sub_80AF138 @ JP 0x080AF138 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF138
	.thumb_func
sub_80AF138:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080AF170
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080AF168 @ =0x00000831
	movs r0, #0x40
	movs r1, #0x30
	bl sub_808B1F4
	ldr r0, _080AF16C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AF178
	movs r0, #0x5b
	bl m4aSongNumStart
	b _080AF178
	.align 2, 0
_080AF168: .4byte 0x00000831
_080AF16C: .4byte 0x0202BCEC
_080AF170:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080AF178:
	pop {r0}
	bx r0

