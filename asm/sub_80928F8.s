	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_80048D8, 0x080048D8 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.section .text.sub_80928F8, "ax", %progbits
@ sub_80928F8 @ JP 0x080928F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80928F8
	.thumb_func
sub_80928F8:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807B4B8
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl sub_80048D8
	ldr r2, _08092938 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0809293C
	movs r0, #0x11
	bl sub_80890A0
	b _08092942
	.align 2, 0
_08092938: .4byte 0x03003020
_0809293C:
	movs r0, #0x1f
	bl sub_80890A0
_08092942:
	ldr r1, _0809297C @ =0x0200D6E0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_808ABD8
	ldr r1, _08092980 @ =0x0202BCEC
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x32
	lsls r0, r0, #7
	ldrb r2, [r2]
	adds r0, r0, r2
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809297C: .4byte 0x0200D6E0
_08092980: .4byte 0x0202BCEC

