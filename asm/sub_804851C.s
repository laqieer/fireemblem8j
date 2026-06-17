	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8042C74, 0x08042C74 + 1
	.set sub_8042CF4, 0x08042CF4 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_804851C, "ax", %progbits
@ sub_804851C @ JP 0x0804851C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804851C
	.thumb_func
sub_804851C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08048560 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	ldr r0, _08048564 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048578
	ldr r1, _08048568 @ =0x03006790
	ldr r0, _0804856C @ =0x0E007400
	ldr r4, _08048570 @ =0x02000000
	movs r5, #0xc0
	lsls r5, r5, #4
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D65C8
	ldr r2, _08048574 @ =sub_804843C
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8042C74
	b _08048582
	.align 2, 0
_08048560: .4byte 0x0203DB60
_08048564: .4byte 0x085D31E8
_08048568: .4byte 0x03006790
_0804856C: .4byte 0x0E007400
_08048570: .4byte 0x02000000
_08048574: .4byte 0x0804843D  @ sub_804843C
_08048578:
	ldr r0, _0804858C @ =0x02000000
	ldr r1, _08048590 @ =sub_80484AC
	adds r2, r6, #0
	bl sub_8042CF4
_08048582:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804858C: .4byte 0x02000000
_08048590: .4byte 0x080484AD  @ sub_80484AC

