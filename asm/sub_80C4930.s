	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set RestoreBlendState, 0x080C45C0 + 1
	.set sub_80C2E68, 0x080C2E68 + 1
	.set sub_80C619C, 0x080C619C + 1
	.section .text.sub_80C4930, "ax", %progbits
@ sub_80C4930 @ JP 0x080C4930 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4930
	.thumb_func
sub_80C4930:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080C496C @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	movs r2, #0
	bl sub_80C2E68
	ldr r0, _080C4970 @ =0x03005270
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
	bl sub_80C619C
	adds r4, #0x30
	adds r0, r4, #0
	bl RestoreBlendState
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C496C: .4byte 0x08AC1108
_080C4970: .4byte 0x03005270

