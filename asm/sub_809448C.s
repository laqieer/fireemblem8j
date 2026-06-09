	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_809448C, "ax", %progbits
@ sub_809448C @ JP 0x0809448C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809448C
	.thumb_func
sub_809448C:
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _080944A4
	ldr r0, _080944A0 @ =0x08A9377C
	movs r1, #3
	bl sub_8002BCC
	b _080944AA
	.align 2, 0
_080944A0: .4byte 0x08A9377C
_080944A4:
	ldr r0, _080944C0 @ =0x08A9377C
	bl Proc_StartBlocking
_080944AA:
	adds r4, r0, #0
	bl ResetUnitSprites
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080944C0: .4byte 0x08A9377C

