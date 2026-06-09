	.syntax unified
	.set FillBGRect, 0x080732A0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_805B80C, 0x0805B80C + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8078DC8, "ax", %progbits
@ sub_8078DC8 @ JP 0x08078DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078DC8
	.thumb_func
sub_8078DC8:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08078E1C @ =0x0884890C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r5, #0x2c]
	ldr r0, _08078E20 @ =0x02023CA8
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl FillBGRect
	ldr r0, _08078E24 @ =0x0201FADC
	bl sub_805B80C
	ldr r4, _08078E28 @ =0x02022928
	ldr r1, _08078E2C @ =0x02020148
	adds r0, r4, #0
	movs r2, #0x10
	bl sub_80D636C
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	movs r3, #0x10
	bl sub_80737A4
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08078E1C: .4byte 0x0884890C
_08078E20: .4byte 0x02023CA8
_08078E24: .4byte 0x0201FADC
_08078E28: .4byte 0x02022928
_08078E2C: .4byte 0x02020148

