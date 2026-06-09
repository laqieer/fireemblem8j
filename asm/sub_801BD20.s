	.syntax unified
	.set PrintDebugBuildDateAndTime, 0x08000AE8 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_80036D8, 0x080036D8 + 1
	.set sub_8008920, 0x08008920 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.section .text.sub_801BD20, "ax", %progbits
@ sub_801BD20 @ JP 0x0801BD20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BD20
	.thumb_func
sub_801BD20:
	push {r4, lr}
	ldr r0, _0801BD70 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _0801BD74 @ =sub_80152C8
	bl sub_8001208
	bl sub_80310F4
	movs r0, #2
	movs r1, #0
	bl sub_80036D8
	ldr r0, _0801BD78 @ =0x080DC6F8
	bl sub_8008920
	ldr r0, _0801BD7C @ =0x085C54D8
	bl StartOrphanMenu
	ldr r4, _0801BD80 @ =0x0202BCAC
	ldrb r2, [r4, #4]
	movs r1, #0x40
	orrs r1, r2
	strb r1, [r4, #4]
	ldr r1, _0801BD84 @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	bl StartMuralBackground
	ldrb r1, [r4, #4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4, #4]
	ldr r0, _0801BD88 @ =0x02023CE8
	bl PrintDebugBuildDateAndTime
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BD70: .4byte 0x08015319  @ sub_8015318
_0801BD74: .4byte 0x080152C9  @ sub_80152C8
_0801BD78: .4byte 0x080DC6F8
_0801BD7C: .4byte 0x085C54D8
_0801BD80: .4byte 0x0202BCAC
_0801BD84: .4byte 0x0600B000
_0801BD88: .4byte 0x02023CE8

