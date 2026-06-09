	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F88, 0x08024F88 + 1
	.section .text.sub_8025CEC, "ax", %progbits
@ sub_8025CEC @ JP 0x08025CEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025CEC
	.thumb_func
sub_8025CEC:
	push {r4, r5, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r1, _08025D18 @ =0x02033F38
	str r0, [r1]
	ldr r0, _08025D1C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	adds r4, #4
	ldr r2, _08025D20 @ =sub_8025C7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8024F88
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025D18: .4byte 0x02033F38
_08025D1C: .4byte 0x0202E4E0
_08025D20: .4byte 0x08025C7D  @ sub_8025C7C

