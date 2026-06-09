	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set Proc_End, 0x08002CBC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set nullsub_47, 0x0804D140 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.section .text.sub_80486D4, "ax", %progbits
@ sub_80486D4 @ JP 0x080486D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80486D4
	.thumb_func
sub_80486D4:
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	movs r0, #3
	bl EndFaceById
	adds r5, r4, #0
	adds r5, #0x2c
	movs r4, #4
_080486E4:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _080486E4
	bl sub_804D0DC
	movs r0, #0
	movs r1, #0
	bl nullsub_47
	ldr r0, _08048724 @ =0x085D31E8
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08048728 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	ldr r0, _0804872C @ =0x0203DA84
	movs r1, #0xa
	bl InitTextDb
	movs r0, #1
	bl sub_800226C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048724: .4byte 0x085D31E8
_08048728: .4byte 0x0203DB60
_0804872C: .4byte 0x0203DA84

