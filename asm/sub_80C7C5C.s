	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80C7BBC, 0x080C7BBC + 1
	.section .text.sub_80C7C5C, "ax", %progbits
@ sub_80C7C5C @ JP 0x080C7C5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7C5C
	.thumb_func
sub_80C7C5C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C7C98 @ =0x08AC26D8
	bl CountProcs
	cmp r0, #1
	bgt _080C7C90
	movs r0, #0
	bl sub_80C7BBC
	ldr r0, _080C7C9C @ =0x08B26938
	ldr r1, _080C7CA0 @ =0x060133C0
	bl sub_8013008
	ldr r0, _080C7CA4 @ =0x08B2699C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080C7C90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7C98: .4byte 0x08AC26D8
_080C7C9C: .4byte 0x08B26938
_080C7CA0: .4byte 0x060133C0
_080C7CA4: .4byte 0x08B2699C

