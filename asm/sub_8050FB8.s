	.syntax unified
	.set sub_80540C0, 0x080540C0 + 1
	.section .text.sub_8050FB8, "ax", %progbits
@ sub_8050FB8 @ JP 0x08050FB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050FB8
	.thumb_func
sub_8050FB8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08050FE4 @ =0x0203E0FC
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08050FE8 @ =0x02017744
	ldr r0, [r0]
	cmp r1, r0
	beq _08050FF4
	ldr r1, _08050FEC @ =0x02000000
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08050FF0 @ =ekrBattle_1
	b _08050FF6
	.align 2, 0
_08050FE4: .4byte 0x0203E0FC
_08050FE8: .4byte 0x02017744
_08050FEC: .4byte 0x02000000
_08050FF0: .4byte 0x08051005  @ ekrBattle_1
_08050FF4:
	ldr r0, _08051000 @ =sub_8051024
_08050FF6:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051000: .4byte 0x08051025  @ sub_8051024

