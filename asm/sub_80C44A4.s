	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C44A4, "ax", %progbits
@ sub_80C44A4 @ JP 0x080C44A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C44A4
	.thumb_func
sub_80C44A4:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ble _080C44F4
	cmp r2, #0
	beq _080C44C4
	ldr r0, _080C44C0 @ =0x08AC1F1C
	adds r1, r2, #0
	bl Proc_StartBlocking
	b _080C44CC
	.align 2, 0
_080C44C0: .4byte 0x08AC1F1C
_080C44C4:
	ldr r0, _080C44F0 @ =0x08AC1F1C
	movs r1, #3
	bl sub_8002BCC
_080C44CC:
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	str r0, [r2, #0x2c]
	ldrb r1, [r4, #8]
	adds r0, r2, #0
	adds r0, #0x34
	strb r1, [r0]
	ldrb r0, [r4, #9]
	adds r1, r2, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4]
	str r0, [r2, #0x38]
	ldr r0, [r4, #4]
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	b _080C450A
	.align 2, 0
_080C44F0: .4byte 0x08AC1F1C
_080C44F4:
	ldr r0, [r4, #4]
	ldrb r1, [r4, #9]
	lsls r1, r1, #1
	ldr r2, _080C4510 @ =0x020228A8
	adds r1, r1, r2
	ldrb r2, [r4, #8]
	bl sub_80D6370
	bl sub_8001EE4
	movs r0, #0
_080C450A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C4510: .4byte 0x020228A8

