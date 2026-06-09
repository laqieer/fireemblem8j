	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_80C6070, "ax", %progbits
@ sub_80C6070 @ JP 0x080C6070 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6070
	.thumb_func
sub_80C6070:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C60D0 @ =0x08AC23F8
	bl CountProcs
	cmp r0, #1
	bgt _080C60A4
	ldr r0, _080C60D4 @ =0x08B1D0BC
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, _080C60D8 @ =0x08B1CF2C
	ldr r4, _080C60DC @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _080C60E0 @ =0x06013000
	adds r0, r4, #0
	movs r2, #6
	movs r3, #4
	bl sub_80130D8
_080C60A4:
	ldr r4, _080C60E4 @ =0x08AC23C0
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _080C60B8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8002BCC
_080C60B8:
	movs r0, #0
	strh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
	adds r2, r5, #0
	adds r2, #0x29
	ldrb r1, [r2]
	subs r0, #2
	ands r0, r1
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C60D0: .4byte 0x08AC23F8
_080C60D4: .4byte 0x08B1D0BC
_080C60D8: .4byte 0x08B1CF2C
_080C60DC: .4byte 0x02020188
_080C60E0: .4byte 0x06013000
_080C60E4: .4byte 0x08AC23C0

